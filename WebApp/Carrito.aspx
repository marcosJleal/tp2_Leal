﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApp.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Carrito</h1>
    <div class="container">
        <div class="row"></div>
        <div class="col">

            <table class="table">

                <tr>
                    <td>Producto</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                    <td>Acción</td>
                    <td>Subtotal</td>
                </tr>
                <%foreach (var prod in carro)
                    {%>
                <tr>
                    <td><%=prod.Producto.NombreArticulo %></td>
                    <td><%=prod.Producto.Precio %></td>
                    <td>
                        <a href="Carrito.aspx?idrestcantidad=<% =prod.Producto.IdArticulo.ToString() %>" class="btn btn-dark">-</a>
                        <%=prod.Cantidad %>
                        <a href="Carrito.aspx?idsumcantidad=<% =prod.Producto.IdArticulo.ToString() %>" class="btn btn-dark">+</a>

                    </td>
                    <td><a href="Carrito.aspx?idquitar=<% =prod.Producto.IdArticulo.ToString() %>" class="btn btn-dark">Quitar</a></td>
                    <td><%="$" %><%=prod.Subtotal %></td>
                </tr>

                <%} %>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="font-weight: bold">Total</td>
                    <td>
                        <asp:Label Text="" runat="server" ID="lblTotal" />
                    </td>
                </tr>
            </table>

        </div>


    </div>
    <%--    <div class="container">
        <div class="row"></div>
        <div class="col">
            <table class="table">
                <tr>
                    <td></td>
                    <td></td>
                    <td style="font-weight: bold">Total</td>
                    <td>
                        <asp:Label Text="" runat="server" ID="lblTotal" />
                    </td>
                </tr>
            </table>

        </div>

    </div>--%>






    <a href="/ProductoCards.aspx" style="margin-right: 20px;" class="btn btn-dark">Seguir Comprando</a>
    <a href="#" class="btn btn-dark">Finalizar Compra</a>

</asp:Content>
