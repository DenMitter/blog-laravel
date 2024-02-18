@extends('layouts.main')

@section('content')
<main class="blog-post">
    <div class="container">
        <h1 class="edica-page-title" data-aos="fade-up">{{ $post->title }}</h1>
        <p class="edica-blog-post-meta" data-aos="fade-up" data-aos-delay="200">{{ $date->translatedFormat('F') }} {{ $date->day }}, {{ $date->year }} • {{ $date->format('H:i') }} • {{ $post->comments->count() }} Коментарів</p>
        <section class="blog-post-featured-img" data-aos="fade-up" data-aos-delay="300">
            <img src="{{ asset('storage/' . $post->mainImage) }}" alt="featured image" class="w-100">
        </section>
        <section class="post-content">
            <div class="row">
                <div class="col-lg-9 mx-auto">
                    {!! $post->content !!}
                </div>
            </div>
        </section>
        <div class="row">
            <div class="col-lg-9 mx-auto">
                <section class="py-3">
                    @auth
                        <form action="{{ route('post.like.store', $post->id) }}" method="POST">
                            @csrf
                            <span>{{ $post->liked_users_count }}</span>
                            <button type="submit" class="border-0 bg-transparent">
                                    @if (auth()->user()->likedPosts->contains($post->id))
                                        <i class="fas fa-heart"></i>
                                    @else
                                        <i class="far fa-heart"></i>
                                    @endif
                            </button>
                        </form>
                    @endauth
                    @guest
                        <div>
                            <span>{{ $post->liked_users_count }}</span>
                            <a href="{{ route('personal.main.index') }}"><i class="far fa-heart text-dark"></i></a>
                        </div>
                    @endguest
                </section>
                @if ($relatedPosts->count() > 0)
                    <section class="related-posts">
                        <h2 class="section-title mb-4" data-aos="fade-up">Схожі пости</h2>
                        <div class="row">
                            @foreach ($relatedPosts as $relatedPost)
                                <div class="col-md-4" data-aos="fade-right" data-aos-delay="100">
                                    <img src="{{ asset('storage/' . $relatedPost->previewImage) }}" alt="related post" class="post-thumbnail">
                                    <p class="post-category">{{ $relatedPost->category->title }}</p>
                                    <a href="{{ route('post.show', $relatedPost->id) }}"><h5 class="post-title">{{ $relatedPost->title }}</h5></a>
                                </div>
                            @endforeach
                        </div>
                    </section>
                @endif
                @if ($post->comments->count() > 0)
                    <h2 class="section-title mb-5" id="comments" data-aos="fade-up">Коментарі ( {{ $post->comments->count() }} )</h3>
                    <section class="comment-list mb-5 bg-light px-5 py-4 rounded">
                        @foreach ($post->comments as $comment)
                            <div class="comment-text mb-3">
                                <span class="username">
                                    <h6>{{ $comment->user->name }}</h6>
                                    <span class="text-muted float-right">{{ $comment->dateAsCarbon->diffForHumans() }}</span>
                                </span>
                                {{ $comment->content }}
                            </div>
                        @endforeach
                    </section>
                @endif
                @auth
                    <section class="comment-section">
                        <h2 class="section-title mb-5" data-aos="fade-up">Написати коментар</h2>
                        <form action="{{ route('post.comment.store', $post->id) }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="form-group col-12" data-aos="fade-up">
                                    <label class="sr-only">Коментар</label>
                                    <textarea name="content" class="form-control" placeholder="Comment" rows="10">{{ old('comment') }}</textarea>
                                </div>
                                <input type="hidden" name="post_id" value="{{ $post->id }}">
                            </div>
                            <div class="row">
                                <div class="col-12" data-aos="fade-up">
                                    <input type="submit" value="Написати" class="btn btn-warning">
                                </div>
                            </div>
                        </form>
                    </section>
                @endauth
                @guest
                    <p class="text-center my-5">Щоб написати коментар необхідно <a class="text-warning" href="{{ route('personal.main.index') }}">авторизуватись</a></p>
                @endguest
            </div>
        </div>
    </div>
</main>
@endsection
