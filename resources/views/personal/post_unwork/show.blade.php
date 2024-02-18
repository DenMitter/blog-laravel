@extends('admin.layouts.main')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6 d-flex align-items-center">
            <h1 class="m-0 mr-3">{{ $post->title }}</h1>
            <a class="text-success mr-1" href="{{ route('admin.post.edit', $post->id) }}"><i class="fas fa-pencil-alt"></i></a>
            <form action="{{ route('admin.post.delete', $post->id) }}" method="POST">
              @csrf
              @method('DELETE')
              <button type="submit" class="border-0 bg-transparent">
                <i class="fas fa-trash text-danger" role="button"></i>
              </button>
            </form>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">{{ $post->title }}</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-5">
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <tbody>
                    <tr>
                      <td>ID</td>
                      <td>{{ $post->id }}</td>
                    </tr>
                    <tr>
                      <td>Назва</td>
                      <td>{{ $post->title }}</td>
                    </tr>
                    <tr>
                      <td>Категорія</td>
                      <td>{{ $post->category_id }}</td>
                    </tr>
                    <tr>
                      <td>Теги</td>
                      <td>Soon</td>
                    </tr>
                    <tr>
                      <td>Прев'ю</td>
                      <td>
                        <img src="{{ url('storage/' . $post->previewImage) }}" alt="previewImage">
                      </td>
                    </tr>
                    <tr>
                      <td>Головне зображення</td>
                      <td>{{ $post->title }}</td>
                    </tr>
                    <tr>
                      <td>Текст</td>
                      <td>{{ $post->content }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
@endsection