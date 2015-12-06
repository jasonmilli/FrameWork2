<?php namespace Frame\Libraries;
class User {
    public static function getUser() {
        return \Work\Models\User::with('group.role.controller')->where('session', '=', $_SESSION['frame_key'])->first();
    }
    public static function hasRole($roll) {
        $user = \Work\Models\User::with('group.role')->where('session', '=', $_SESSION['frame_key'])->first();
        if (isset($user->group)) {
            foreach ($user->group as $group) {
                if (isset($group->pivot->role)) {
                    foreach ($group->pivot->role as $role) {
                        if ($role->pivot->role == $roll) return true;
                    }
                }
            }
        }
        return false;
    }
    public static function getController($controller_id) {
        if (isset($user->group)) {
            foreach ($user->group as $group) {
                if (isset($group->pivot->role)) {
                    foreach ($group->pivot->role as $role) {
                        if (isset($role->pivot->controller)) {
                            foreach ($role->pivot->controller as $controller) {
                                if ($controller->pivot->controller_id == $controller_id) {
                                    return $controller->pivot->controller;
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
}
