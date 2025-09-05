<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\LikeController;

//Public routes
Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);

//Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {

    //User
    Route::get('/user', [AuthController::class, 'user']);
    Route::post('/logout', [AuthController::class, 'logout']);

    //Post
    Route::get('/posts', [PostController::class, 'index']);// All Posts
    Route::post('/posts', [PostController::class, 'store']);// Create Post
    Route::get('/posts/{id}', [PostController::class, 'show']);// Get Single Post
    Route::put('/posts/{id}', [PostController::class, 'update']);//Update Post
    Route::delete('/posts/{id}', [PostController::class, 'destroy']);//Delete Post

    //Comment
    Route::get('/posts/{id}/comments', [CommentController::class, 'index']);// All Comments
    Route::post('/posts/{id}/comments', [CommentController::class, 'store']);// Create Comment
    Route::put('/comments/{id}', [CommentController::class, 'update']);//Update Comment
    Route::delete('/comments/{id}', [CommentController::class, 'destroy']);//Delete Comment

    //Like
    Route::post('/posts/{id}/likes', [LikeController::class, 'likeOrUnlike']);// Like or Unlike
});