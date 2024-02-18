<?php

namespace App\Service;

use App\Models\Post;
use DB;
use Illuminate\Support\Facades\Storage;

class PostService {
    public function store($data) {
        try {
            Db::beginTransaction();
            if(isset($data['tag_ids'])) {
                $tagIds = $data['tag_ids'];
                unset($data['tag_ids']);
            }

            $data['previewImage'] = Storage::disk('public')->put('/images', $data['previewImage']);
            $data['mainImage'] = Storage::disk('public')->put('/images', $data['mainImage']);
            $post = Post::firstOrCreate($data);
            if(isset($data['tag_ids'])) $post->tags()->attach($tagIds);
            DB::commit();
        } catch(\Exception $exception) {
            DB::rollBack();
            abort(500);
        }
    }

    public function update($data,$post) {
        try {
            Db::beginTransaction();
            if(isset($data['tag_ids'])) {
                $tagIds = $data['tag_ids'];
                unset($data['tag_ids']);
            }

            if(isset($data['previewImage'])) $data['previewImage'] = Storage::disk('public')->put('/images', $data['previewImage']);
            if(isset($data['mainImage'])) $data['mainImage'] = Storage::disk('public')->put('/images', $data['mainImage']);

            $post->update($data);
            if(isset($data['tag_ids'])) $post->tags()->attach($tagIds);
            DB::commit();
        } catch(\Exception $exception) {
            DB::rollBack();
            abort(500);
        }

        return $post;
    }
}