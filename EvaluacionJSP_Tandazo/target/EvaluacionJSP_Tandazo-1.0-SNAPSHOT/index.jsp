<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Healthy Food Delivery</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        /* ESTILOS MODERNOS */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); /* Fondo degradado suave */
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            padding: 50px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            font-weight: 600;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #7f8c8d;
            margin-bottom: 50px;
            font-size: 1.1rem;
        }

        h2.section-title {
            color: #2e7d32;
            border-bottom: 2px solid #e8f5e9;
            padding-bottom: 10px;
            margin-top: 40px;
            margin-bottom: 25px;
            font-size: 1.5rem;
        }

        /* GRID DE PRODUCTOS */
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
        }
        
        /* TARJETA DE PRODUCTO */
        .product-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            border-color: #a5d6a7;
        }

        .product-img {
            width: 100%;
            height: 140px;
            object-fit: contain; /* Esto evita que se recorten feo las imágenes */
            margin-bottom: 15px;
            border-radius: 10px;
        }

        .product-title {
            font-weight: 600;
            font-size: 1.1rem;
            color: #34495e;
            margin: 10px 0 5px 0;
            min-height: 50px; /* Alinea los títulos si unos son más largos */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-price {
            display: inline-block;
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 15px;
        }

        /* INPUT PERSONALIZADO */
        input[type="number"] {
            width: 70px;
            padding: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus {
            border-color: #2e7d32;
            background-color: #fafafa;
        }

        /* BOTONES */
        .btn-container { 
            text-align: center; 
            margin-top: 50px;
        }
        
        .btn-submit {
            background: linear-gradient(45deg, #ff7043, #ff5722);
            color: white;
            padding: 16px 50px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 10px 20px rgba(255, 87, 34, 0.3);
            transition: transform 0.2s, box-shadow 0.2s;
            font-family: 'Poppins', sans-serif;
        }

        .btn-submit:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 25px rgba(255, 87, 34, 0.4);
        }
        
        .btn-back {
            background-color: #546e7a;
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 30px;
            display: inline-block;
            margin-top: 30px;
            font-weight: 500;
            transition: background 0.3s;
        }
        .btn-back:hover { background-color: #455a64; }

        /* TABLA DE RECIBO */
        .receipt-box {
            border: 2px dashed #ccc;
            padding: 30px;
            border-radius: 10px;
            background-color: #fafafa;
            margin-top: 20px;
        }

        .receipt-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .receipt-table th {
            text-align: left;
            color: #7f8c8d;
            font-weight: 500;
            border-bottom: 2px solid #eee;
            padding: 10px;
        }
        
        .receipt-table td {
            padding: 15px 10px;
            border-bottom: 1px solid #eee;
            font-weight: 500;
        }

        .total-row td {
            font-size: 1.5rem;
            color: #2e7d32;
            font-weight: 700;
            padding-top: 20px;
            border-bottom: none;
        }
    </style>
</head>
<body>

<div class="container">
    
    <% 
        // --- LÓGICA JAVA (No cambia, solo añadimos tu corrección de "hamburgesa") ---
        boolean mostrarRecibo = false;
        double granTotal = 0.0;
        
        String[] nombres = {"Hamburguesa Vegetariana", "Pasta al Pesto", "Pizza Caprese", "Quinoa con Verdura", "Agua Mineral", "Cerveza", "Refresco"};
        double[] precios = {6.20, 4.90, 5.50, 6.95, 1.00, 1.50, 1.40};
        String[] inputs = {"hamburguesa", "pasta", "pizza", "quinoa", "agua", "cerveza", "refresco"};
        
        // Aquí están tus imágenes tal cual las tienes en tu carpeta
        String[] imagenes = {
            "img/hamburgesa.webp", 
            "img/pasta.jpg",
            "img/pizza.webp",
            "img/quinoa.jpg",
            "img/agua.jpg",
            "img/cerveza.jpg",
            "img/refresco.jpg"
        };
        
        int[] cantidades = new int[nombres.length];

        if (request.getParameter("calcular") != null) {
            mostrarRecibo = true;
            try {
                for(int i=0; i<nombres.length; i++) {
                    String param = request.getParameter(inputs[i]);
                    // Truco: si está vacío (""), lo tomamos como 0
                    cantidades[i] = (param == null || param.isEmpty()) ? 0 : Integer.parseInt(param);
                    granTotal += cantidades[i] * precios[i];
                }
            } catch (Exception e) {
                out.println("<script>alert('Error: Verifique los números ingresados');</script>");
            }
        }
    %>

    <% if (mostrarRecibo) { %>
        
        <h1>¡Pedido Confirmado! ✅</h1>
        <p class="subtitle">Aquí tienes el detalle de tu compra</p>

        <div class="receipt-box">
            <table class="receipt-table">
                <thead>
                    <tr>
                        <th width="50%">Producto</th>
                        <th>Precio Unit.</th>
                        <th>Cant.</th>
                        <th style="text-align:right">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(int i=0; i<nombres.length; i++) { 
                        if (cantidades[i] > 0) { 
                            double subtotal = cantidades[i] * precios[i];
                    %>
                    <tr>
                        <td><%= nombres[i] %></td>
                        <td><%= String.format("%.2f", precios[i]) %> €</td>
                        <td>x <%= cantidades[i] %></td>
                        <td style="text-align:right"><%= String.format("%.2f", subtotal) %> €</td>
                    </tr>
                    <% } } %>
                    
                    <tr class="total-row">
                        <td colspan="3" style="text-align: right;">Total a Pagar:</td>
                        <td style="text-align: right;"><%= String.format("%.2f", granTotal) %> €</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div style="text-align: center;">
            <a href="index.jsp" class="btn-back">⬅ Volver al Menú</a>
        </div>

    <% } else { %>

        <h1>Menú Healthy Food 🥗</h1>
        <p class="subtitle">Selecciona tus platos favoritos y recíbelos en casa</p>
        
        <form action="" method="post">
            
            <h2 class="section-title">Platos Principales</h2>
            <div class="menu-grid">
                <% for(int i=0; i<4; i++) { %>
                <div class="product-card">
                    <img src="<%= imagenes[i] %>" alt="<%= nombres[i] %>" class="product-img">
                    <div class="product-title"><%= nombres[i] %></div>
                    <span class="product-price"><%= String.format("%.2f", precios[i]) %> €</span>
                    <input type="number" name="<%= inputs[i] %>" value="0" min="0">
                </div>
                <% } %>
            </div>

            <h2 class="section-title">Bebidas Refrescantes</h2>
            <div class="menu-grid">
                <% for(int i=4; i<7; i++) { %>
                <div class="product-card">
                    <img src="<%= imagenes[i] %>" alt="<%= nombres[i] %>" class="product-img">
                    <div class="product-title"><%= nombres[i] %></div>
                    <span class="product-price"><%= String.format("%.2f", precios[i]) %> €</span>
                    <input type="number" name="<%= inputs[i] %>" value="0" min="0">
                </div>
                <% } %>
            </div>

            <div class="btn-container">
                <input type="submit" name="calcular" value="Realizar Pedido" class="btn-submit">
            </div>
        </form>

    <% } %>
    
</div>

</body>
</html>