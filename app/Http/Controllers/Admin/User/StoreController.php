<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\User\StoreRequest;
use App\Jobs\StoreUserJob;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $reuest) {
        $data = $reuest->validated();
        
        StoreUserJob::dispatch($data);
        return redirect()->route('admin.user.index');
    }
}
