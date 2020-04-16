<?php

namespace App\Http\Controllers\AuthPetugas;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Admin;
use App\Models\Petugas;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */
    protected $redirectTo = '/petugas';
    

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest:petugas')->except('logoutUser', 'logoutAdmin', 'logoutPetugas');
    
    }


    public function showLoginForm()
    {
        return view('authPetugas.login');
    }

    

    public function login(Request $request)
    {
        $this->validate($request, [
            'username'   => 'required',
            'password' => 'required'
        ]);

        if (Auth::guard('petugas')->attempt(['username' => $request->username, 'password' => $request->password], $request->get('remember'))) {

            return redirect()->intended(route('petugas.home'));
        }
        return back()->withInput($request->only('username', 'remember'));
    }

    public function logoutPetugas()
    {
        Auth::guard('petugas')->logout();
        return redirect('petugas/login');
    }


    public function username()
    {
        return 'username';
    }
}
