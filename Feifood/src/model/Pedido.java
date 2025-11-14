package model;

import java.util.ArrayList;
import java.util.List;

public class Pedido {

    private int id;
    private String data;
    private double total;
    private List<PedidoItem> itens = new ArrayList<>();

    public Pedido() {}

    public Pedido(int id, String data, double total) {
        this.id = id;
        this.data = data;
        this.total = total;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getData() { return data; }
    public void setData(String data) { this.data = data; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public List<PedidoItem> getItens() { return itens; }
    public void setItens(List<PedidoItem> itens) { this.itens = itens; }

    public void adicionarItem(PedidoItem item){
        itens.add(item);
        total += item.getPrecoUnitario() * item.getQuantidade();
    }

    public void removerItem(PedidoItem item){
        itens.remove(item);
        total -= item.getPrecoUnitario() * item.getQuantidade();
    }
}
