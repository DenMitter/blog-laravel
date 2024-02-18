<?php

namespace App\Http\Controllers\Admin\Category;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Category\StoreRequest;
use Illuminate\Http\Request;
use App\Models\Category;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $reuest) {
        $data = $reuest->validated();
        Category::firstOrCreate($data);
        return redirect()->route('admin.category.index');
    }
}
