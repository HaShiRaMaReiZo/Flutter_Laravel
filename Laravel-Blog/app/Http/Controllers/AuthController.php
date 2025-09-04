<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    //Register User
    public function register(Request $request)
    {
        $attrs = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
        ]);

        //Create user
        $user = User::create([
            'name' => $attrs['name'],
            'email' => $attrs['email'],
            'password' => bcrypt($attrs['password']),
        ]);

        //return user & token in response
        return response([
            'user' => $user,
            'token' => $user->createToken('secret')->plainTextToken,
        ]);
    }

    //Login User
    public function login(Request $request)
    {
        $attrs = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);

        //attempt login
        if(!Auth::attempt($attrs))
        {
            return response([
                'message' => 'Invalid credentials',
            ], 403);
        }
        //return user & token in response
        return response([
            'user' => auth()->user(),
            'token' => auth()->user()->createToken('secret')->plainTextToken,
        ],200);
    }

    //Logout User
    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response([
            'message' => 'Logged out',
        ],200);
    }

    //Get User details 
    public function user()
    {
        return response([
            'user' => auth()->user(),
        ],200);
    }

    //Update User
    public function update()
    {
        $attrs = $request->validate([
            'name' => 'required |string',
        ]);

        $image = $this->saveImahge($request->image, 'profiles');

        auth()->user()->update([
            'name' => $attrs['name'],
            'image' => $image,
        ]);

        return response([
            'user' => auth()->user(),
            'message' => 'User updated',
        ],200);
    }
}
