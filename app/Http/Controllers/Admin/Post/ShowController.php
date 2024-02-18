<?php

namespace App\Http\Controllers\Admin\Post;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;

class ShowController extends BaseController
{
    public function __invoke(Post $post) {
        $tags = Tag::all();
        return view('admin.post.show', compact('post', 'tags'));
    }
}
