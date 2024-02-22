<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $orders = Order::all();
        return view ('orders.index', ['orders' => $orders]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view ('orders.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'Quantity' => 'required|string',
            'Contact' => 'required|string',
            'Total' => 'required|string',
        ]);

        $newOrder = new Order;

        $newOrder->quentity = $request->input('Quantity');
        $newOrder->contact = $request->input('Contact');
        $newOrder->total = $request->input('Total');

        if ($newOrder->save()) {
            return redirect()->route('articles.index')->with('state', 1);
        } else {
            return redirect()->route('articles.index')->with('state', 1);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $order = Order::find($id);
        return view ('orders.show', ['order' => $order]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $order = Order::find($id);
        return view ('orders.edit', ['order' => $order]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $order = Order::find($id);

        $order->username = $request->input('Username');
        $order->quantity = $request->input('Quantity');
        $order->contact = $request->input('Contact');
        $order->total = $request->input('Total');
        $order->status = $request->input('Status');

        $order->update();

        return redirect()->route('articles.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $order = Order::find($id);
        if ($order) {
            $order->delete();
            return redirect()->route('articles.index')->with('success', 'article supprimé avec succès');
        } else {
            return redirect()->route('articles.index')->with('error', 'Essayer plus tard');
        }
    }
}
