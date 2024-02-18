<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use App\Models\User;

class ShowController extends Controller
{
    public function __invoke(User $user) {
        $roles = User::getRoles();
        return view('admin.user.show', compact('user', 'roles'));
    }
}
