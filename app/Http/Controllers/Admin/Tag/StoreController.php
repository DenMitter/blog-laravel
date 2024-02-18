<?php

namespace App\Http\Controllers\Admin\Tag;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Tag\StoreRequest;
use Illuminate\Http\Request;
use App\Models\Tag;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $reuest) {
        $data = $reuest->validated();
        Tag::firstOrCreate(['title' => $data['title']]);
        return redirect()->route('admin.tag.index');
    }
}
