<?php
namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;

class UserController extends Controller
{
    /**
     * Show the profile for a given user.
     *
     * @param int $id
     * @return View
     */
    public function user_detail(int $id): View
    {
        $data = [
            'user' => (new User)->findOrFail($id)
        ];
        return view('user_detail', $data);
    }

    /**
     * Show the profile for a given user.
     *
     * @return View
     */
    public function users_list(): View
    {
        $data = [
            'users' => (new User)->all()
        ];
        return view('users_list', $data);
    }
}
