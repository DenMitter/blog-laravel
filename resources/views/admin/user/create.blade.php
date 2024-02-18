@extends('admin.layouts.main')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Додавання користувача</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Додавання користувача</li>
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
              <form action="{{ route('admin.user.store') }}" method="POST">
                @csrf
                <div class="card-body">
                  <div class="form-group">
                    <label>Ім'я</label>
                    <input type="text" name="name" class="form-control" placeholder="Введіть ім'я користувача" value="{{ old('name') }}">
                    @error('name')
                      <div class="text-danger">{{ $message }}</div>
                    @enderror
                  </div>
                  <div class="form-group">
                    <label>Пошта</label>
                    <input type="email" name="email" class="form-control" placeholder="Введіть пошту користувача" value="{{ old('email') }}">
                    @error('email')
                      <div class="text-danger">{{ $message }}</div>
                    @enderror
                  </div>
                  <div class="form-group">
                    <label>Виберіть роль</label>
                    <select class="form-control" name="role">
                      @foreach ($roles as $id => $role)
                        <option {{ $id == old('role') ? ' selected' : '' }} value="{{ $id }}">{{ $role }}</option>
                      @endforeach
                    </select>
                    @error('role')
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