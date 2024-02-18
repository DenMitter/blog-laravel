<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', 'App\Http\Controllers\Main\IndexController')->name('main.index');

Route::group(['prefix' => 'personal', 'middleware' => ['auth', 'verified']], function() {
    Route::get('/', 'App\Http\Controllers\Personal\Main\IndexController')->name('personal.main.index');

    Route::group(['prefix' => 'liked'], function() {
        Route::get('/', 'App\Http\Controllers\Personal\Liked\IndexController')->name('personal.liked.index');
        Route::delete('/{post}', 'App\Http\Controllers\Personal\Liked\DeleteController')->name('personal.liked.delete');
    });
    Route::group(['prefix' => 'comment'], function() {
        Route::get('/', 'App\Http\Controllers\Personal\Comment\IndexController')->name('personal.comment.index');
        Route::get('/{comment}/edit', 'App\Http\Controllers\Personal\Comment\EditController')->name('personal.comment.edit');
        Route::patch('/{comment}', 'App\Http\Controllers\Personal\Comment\UpdateController')->name('personal.comment.update');
        Route::delete('/{comment}', 'App\Http\Controllers\Personal\Comment\DeleteController')->name('personal.comment.delete');
    });
});

Route::group(['prefix' => 'posts'], function() {
    Route::get('/', 'App\Http\Controllers\Post\IndexController')->name('post.index');
    Route::get('/{post}', 'App\Http\Controllers\Post\ShowController')->name('post.show');
    
    Route::group(['prefix' => '{post}/comments'], function(){
        Route::post('/', 'App\Http\Controllers\Post\Comment\StoreController')->name('post.comment.store');
    });
    Route::group(['prefix' => '{post}/likes'], function(){
        Route::post('/', 'App\Http\Controllers\Post\Like\StoreController')->name('post.like.store');
    });
});

Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'admin', 'verified']], function() {
    Route::get('/', 'App\Http\Controllers\Admin\Main\IndexController')->name('admin.main.index');
    
    Route::group(['prefix' => 'posts'], function() {
        Route::get('/', 'App\Http\Controllers\Admin\Post\IndexController')->name('admin.post.index');
        Route::get('/create', 'App\Http\Controllers\Admin\Post\CreateController')->name('admin.post.create');
        Route::post('/', 'App\Http\Controllers\Admin\Post\StoreController')->name('admin.post.store');
        Route::get('/{post}', 'App\Http\Controllers\Admin\Post\ShowController')->name('admin.post.show');
        Route::get('/{post}/edit', 'App\Http\Controllers\Admin\Post\EditController')->name('admin.post.edit');
        Route::patch('/{post}', 'App\Http\Controllers\Admin\Post\UpdateController')->name('admin.post.update');
        Route::delete('/{post}', 'App\Http\Controllers\Admin\Post\DeleteController')->name('admin.post.delete');
    });

    Route::group(['prefix' => 'categories'], function() {
        Route::get('/', 'App\Http\Controllers\Admin\Category\IndexController')->name('admin.category.index');
        Route::get('/create', 'App\Http\Controllers\Admin\Category\CreateController')->name('admin.category.create');
        Route::post('/', 'App\Http\Controllers\Admin\Category\StoreController')->name('admin.category.store');
        Route::get('/{category}', 'App\Http\Controllers\Admin\Category\ShowController')->name('admin.category.show');
        Route::get('/{category}/edit', 'App\Http\Controllers\Admin\Category\EditController')->name('admin.category.edit');
        Route::patch('/{category}', 'App\Http\Controllers\Admin\Category\UpdateController')->name('admin.category.update');
        Route::delete('/{category}', 'App\Http\Controllers\Admin\Category\DeleteController')->name('admin.category.delete');
    });

    Route::group(['prefix' => 'tags'], function() {
        Route::get('/', 'App\Http\Controllers\Admin\Tag\IndexController')->name('admin.tag.index');
        Route::get('/create', 'App\Http\Controllers\Admin\Tag\CreateController')->name('admin.tag.create');
        Route::post('/', 'App\Http\Controllers\Admin\Tag\StoreController')->name('admin.tag.store');
        Route::get('/{tag}', 'App\Http\Controllers\Admin\Tag\ShowController')->name('admin.tag.show');
        Route::get('/{tag}/edit', 'App\Http\Controllers\Admin\Tag\EditController')->name('admin.tag.edit');
        Route::patch('/{tag}', 'App\Http\Controllers\Admin\Tag\UpdateController')->name('admin.tag.update');
        Route::delete('/{tag}', 'App\Http\Controllers\Admin\Tag\DeleteController')->name('admin.tag.delete');
    });

    Route::group(['prefix' => 'users'], function() {
        Route::get('/', 'App\Http\Controllers\Admin\User\IndexController')->name('admin.user.index');
        Route::get('/create', 'App\Http\Controllers\Admin\User\CreateController')->name('admin.user.create');
        Route::post('/', 'App\Http\Controllers\Admin\User\StoreController')->name('admin.user.store');
        Route::get('/{user}', 'App\Http\Controllers\Admin\User\ShowController')->name('admin.user.show');
        Route::get('/{user}/edit', 'App\Http\Controllers\Admin\User\EditController')->name('admin.user.edit');
        Route::patch('/{user}', 'App\Http\Controllers\Admin\User\UpdateController')->name('admin.user.update');
        Route::delete('/{user}', 'App\Http\Controllers\Admin\User\DeleteController')->name('admin.user.delete');
    });
});

Auth::routes(['verify' => true]);