@extends('admin.layouts.main')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Додавання поста</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Додавання поста</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-5">
            <div class="card card-primary">
              <!-- /.card-header -->
              <!-- form start -->
              <form action="{{ route('admin.post.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="card-body">
                  <div class="form-group">
                    <label>Назва</label>
                    <input type="text" name="title" class="form-control" placeholder="Введіть назву поста" value="{{ old('title') }}">
                    @error('title')
                      <div class="text-danger">{{ $message }}</div>
                    @enderror
                  </div>
                  <div class="d-flex justify-content-between">
                    <div class="form-group col-6 p-0">
                      <label>Виберіть категорію</label>
                      <select class="form-control" name="category_id">
                        @foreach ($categories as $category)
                          <option {{ $category->id == old('category_id') ? ' selected' : '' }} value="{{ $category->id }}">{{ $category->title }}</option>
                        @endforeach
                      </select>
                      @error('category_id')
                        <div class="text-danger">{{ $message }}</div>
                      @enderror
                    </div>
                    <div class="form-group col-5 p-0">
                      <label>Теги</label>
                      <select class="select2" name="tag_ids[]" multiple="multiple" data-placeholder="Виберіть теги" style="width: 100%;">
                        @foreach ($tags as $tag)
                          <option {{ is_array(old('tag_ids')) && in_array($tag->id, old('tag_ids')) ? ' selected' : '' }} value="{{ $tag->id }}">{{ $tag->title }}</option>
                        @endforeach
                      </select>
                      @error('tag_ids')
                        <div class="text-danger">{{ $message }}</div>
                      @enderror
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Зображення для поста</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" name="previewImage">
                        <label class="custom-file-label">Виберіть зображення</label>
                      </div>
                    </div>
                    @error('previewImage')
                      <div class="text-danger">{{ $message }}</div>
                    @enderror
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">Головне зображення для поста</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" name="mainImage">
                        <label class="custom-file-label">Виберіть зображення</label>
                      </div>
                    </div>
                    @error('mainImage')
                      <div class="text-danger">{{ $message }}</div>
                    @enderror
                  </div>
                  <div class="fotm-group">
                    <textarea id="summernote" name="content">
                      {{ old('content') }}
                    </textarea>
                    @error('content')
                      <div class="text-danger">{{ $message }}</div>
                    @enderror
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Додати</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
@endsection