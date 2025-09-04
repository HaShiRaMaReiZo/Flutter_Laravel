<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Like;

class LikeController extends Controller
{
    // like or Unlike
    public function  likeOrUnlike($id)
    {
        $post = Post::find($id);
        
        if(!$post)
        {
            return response([
                'message' => 'Post not found',
            ], 404);
        }

        $like = $post->likes()->where('user_id', auth()->user()->id)->first();


        //if not like then like
        if(!$like)
        {
           Like::create([
            'post_id' => $id,
            'user_id' => auth()->user()->id
           ]);
           
           return response([
            'message' => 'Liked'
        ], 200);
        }
        //else dislike it
        $like->delete();
        return response([
            'message' => 'Unliked'
        ], 200);
    }
}
