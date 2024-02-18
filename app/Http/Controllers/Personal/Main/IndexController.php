<?php

namespace App\Http\Controllers\Personal\Main;

use App\Http\Controllers\Controller;
use App\Models\Post;

class IndexController extends Controller
{
    public function __invoke(Post $post) {
        $posts = auth()->user();
        return view('personal.main.index', compact('posts'));
    }
}
