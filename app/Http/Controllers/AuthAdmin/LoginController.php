<?php

namespace App\Http\Controllers\AuthAdmin;

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
    protected $redirectTo = '/admin';
    

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest:admin')->except('logoutUser', 'logoutAdmin', 'logoutPetugas');
    
    }



    public function showLoginForm()
    {
        return view('authAdmin.login');
    }

    

    public function login(Request $request)
    {
        $this->validate($request, [
            'username'   => 'required',
            'password' => 'required'
        ]);

        if (Auth::guard('admin')->attempt(['username' => $request->username, 'password' => $request->password], $request->get('remember'))) {

            return redirect()->intended(route('admin.home'));
        }
        return back()->withInput($request->only('username', 'remember'));
    }

    public function logoutAdmin()
    {
        Auth::guard('admin')->logout();
        return redirect('admin/login');
    }


    public function username()
    {
        return 'username';
    }
}
