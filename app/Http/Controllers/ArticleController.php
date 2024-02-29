<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $articles = Article::all();
        return view ('articles.index', ['articles' => $articles]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view ('articles.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'Image' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
            'Libelle' => 'required|string',
            'Prix' => 'required|numeric',
        ]);

        $newArticle = new Article;

        $newArticle->label = $request->input('Libelle');
        $newArticle->price = $request->input('Prix');

        if ($request->hasFile('Image'))
        {
            $image = $request->file('Image');
            $extension = $image->getClientOriginalExtension();
            $imageName = time() . '.' . $extension;
            $image->move('images/', $imageName);
            $newArticle->image = $imageName;
        }

        if ($newArticle->save()) {
            return redirect()->route('articles.show', ['article' => $newArticle->id])->with('state', 1);
        } else {
            return redirect()->route('articles.create')->with('state', 1);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $article = Article::find($id);
        return view ('articles.show', ['article' => $article]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $article = Article::find($id);
        return view ('articles.edit', ['article' => $article]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $article = Article::find($id);

        $article->libelle = $request->input('Libelle');
        $article->prix = $request->input('Prix');
        $article->image = $request->input('Image');

        $article->update();

        return redirect()->route('articles.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $article = Article::find($id);
        if ($article) {
            $article->delete();
            return redirect()->route('articles.index')->with('success', 'article supprimé avec succès');
        } else {
            return redirect()->route('articles.index')->with('error', 'Essayer plus tard');
        }
    }

    public function import() 
    {
        Excel::import(new UsersImport, 'users.xlsx');
        
        return redirect('/')->with('success', 'All good!');
    }

    public function generatePDF()
    {
        $orders = Order::all();

        $pdf = PDF::loadView('orders.orderPDF', compact('orders'));

        return $pdf->download('report.pdf');
    }
}
