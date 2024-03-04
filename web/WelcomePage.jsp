<%-- 
    Document   : WelcomePage
    Created on : Mar 1, 2024, 8:25:34 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet"  href="styles/main_styles.css">
        <link rel="stylesheet" href="styles/scanner.css">

        <style>
            .container1 {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 70vh;
            }
            .abutton {
                --glow-color: rgb(217, 176, 255);
                color: var(--glow-color);
                text-shadow: 0 0 .5em var(--glow-color);

            }
            button {
                --glow-color: rgb(217, 176, 255);
                --glow-spread-color: rgba(191, 123, 255, 0.781);
                --enhanced-glow-color: rgb(231, 206, 255);
                --btn-color: rgb(100, 61, 136);
                border: .25em solid var(--glow-color);
                padding: 1em 3em;
                color: var(--glow-color);
                font-size: 15px;
                font-weight: bold;
                background-color: var(--btn-color);
                border-radius: 1em;
                outline: none;
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 1em var(--glow-spread-color),
                    inset 0 0 .75em .25em var(--glow-color);
                text-shadow: 0 0 .5em var(--glow-color);
                position: relative;
                transition: all 0.3s;
            }

            button::after {
                pointer-events: none;
                content: "";
                position: absolute;
                top: 120%;
                left: 0;
                height: 100%;
                width: 100%;
                background-color: var(--glow-spread-color);
                filter: blur(2em);
                opacity: .7;
                transform: perspective(1.5em) rotateX(35deg) scale(1, .6);
            }

            button:hover {
                color: var(--btn-color);
                background-color: var(--glow-color);
                box-shadow: 0 0 1em .25em var(--glow-color),
                    0 0 4em 2em var(--glow-spread-color),
                    inset 0 0 .75em .25em var(--glow-color);
            }

            button:active {
                box-shadow: 0 0 0.6em .25em var(--glow-color),
                    0 0 2.5em 2em var(--glow-spread-color),
                    inset 0 0 .5em .25em var(--glow-color);
            }
            
            body {
                width: 100%;
                height: 100%;
                --color: rgba(114, 114, 114, 0.3);
                background-color: #191a1a;
                background-image: linear-gradient(0deg, transparent 24%, var(--color) 25%, var(--color) 26%, transparent 27%,transparent 74%, var(--color) 75%, var(--color) 76%, transparent 77%,transparent),
                    linear-gradient(90deg, transparent 24%, var(--color) 25%, var(--color) 26%, transparent 27%,transparent 74%, var(--color) 75%, var(--color) 76%, transparent 77%,transparent);
                background-size: 55px 55px;
            }
            form {
                background-color: #444444;
                border-radius: 10px;
                padding: 20px;
                width: 300px;
                margin: 50px auto;
                color: lightgray;
                height: 500px;
            }
        </style>
    </head>
    <body>
        <h1 style="text-align: center; color: salmon">CSE 453</h1>
        <div class="container1">
            <button style="margin-right: 100px" ><a href="TriangleJSP.jsp" class="abutton">Triangle Function</a></button>
            <button><a href="CommissionJSP.jsp" class="abutton">Commission Function</a></button>
        </div>
    </body>
</html>
