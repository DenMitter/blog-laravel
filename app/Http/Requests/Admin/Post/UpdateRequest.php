<?php

namespace App\Http\Requests\Admin\Post;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|string',
            'content' => 'required|string',
            'previewImage' => 'nullable|file',
            'mainImage' => 'nullable|file',
            'category_id' => 'required|integer|exists:categories,id',
            'tag_ids' => 'nullable|array',
            'tag_ids.*' => 'nullable|integer|exists:tags,id'
        ];
    }

    public function messages() {
        return [
            'title.required' => 'Це поле необхідно заповнити',
            'title.string' => 'Данні мають бути записані строкою',
            'content.required' => 'Це поле необхідно заповнити',
            'content.string' => 'Данні мають бути записані строкою',
            'previewImage.required' => 'Це поле необхідно заповнити',
            'previewImage.file' => 'Необхідно вибрати файл',
            'mainImage.required' => 'Це поле необхідно заповнити',
            'mainImage.file' => 'Необхідно вибрати файл',
            'category_id.required' => 'Це поле необхідно заповнити',
            'category_id.integer' => 'ID має бути числом',
            'category_id.exists' => 'ID має існувати у базі данних',
            'tag_ids.array' => 'Потрібно вибрати теги'
        ];
    }
}
