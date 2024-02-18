<?php

namespace App\Http\Requests\Admin\User;

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
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users,email,' . $this->user_id,
            'user_id' => 'required|integer|exists:users,id',
            'role' => 'required|integer'
        ];
    }

    public function messages() {
        return [
            'name.required' => 'Це поле необхідно заповнити',
            'name.string' => 'Данні мають бути записані строкою',
            'email.required' => 'Це поле необхідно заповнити',
            'email.string' => 'Данні мають бути записані строкою',
            'email.email' => 'Пошта має відповідати формату mail@some.domain',
            'email.unique' => 'Користувач з такою поштою вже існує'
        ];
    }
}
