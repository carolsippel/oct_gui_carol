clc
close all
clear all

graphics_toolkit qt

% Dados usados para exemplo
h.nome_txt_1 = "";
h.caminho_txt_1 = "";
h.nome_txt_2 = "";
h.caminho_txt_2 = "";

h.x1 = [1:20];
h.y1 = [1:20];

h.x2 = [1:.5:50];
h.y2 = [1:.5:50];

% Configurações da interface gráfica
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"),
    "Position", [10 10 1000 900],
    "Name","QY Calculator - Duas medidas - Carol Sippel",
    "NumberTitle","off");

% Funções utilizadas ao pressionar os botões
function execute_procura_txt_1 (obj)
    h = guidata (obj);

    [h.nome_txt_1,h.caminho_txt_1] = uigetfile('*.txt');
    if isequal(h.nome_txt_1,0)
        disp("Usuario nao selecionou nada...");
    else
        disp(["txt1 > Usuario selecionou:", fullfile(h.caminho_txt_1,h.nome_txt_1)]);
    end

    % Exemplo
    % Multiplicamos o dado da interface gráfica
    h.x1 = h.x1.*h.x1;
    h.y1 = h.y1.*h.y1;
    set(h.plot_1, 'YData', h.y1, 'XData', h.x1);
    % E agora armazenamos o dado de volta na interface
    % gráfica
    guidata(obj, h);
endfunction

function execute_procura_txt_2 (obj)
    h = guidata (obj);

    [h.nome_txt_2,h.caminho_txt_2] = uigetfile('*.txt');
    if isequal(h.nome_txt_2,0)
        disp("Usuario nao selecionou nada...");
    else
        disp(["txt2 > Usuario selecionou:", fullfile(h.caminho_txt_2,h.nome_txt_2)]);
    end

    % Exemplo
    % Multiplicamos o dado da interface gráfica
    h.x2 = h.x2.*h.x2;
    h.y2 = h.y2.*h.y2;
    set(h.plot_2, 'YData', h.y2, 'XData', h.x2);
    % E agora armazenamos o dado de volta na interface
    % gráfica
    guidata(obj, h);
endfunction

% Define o offset para posicionar os gráficos/imagens
pos_grafico_offset_x = 0.0;
pos_grafico_offset_y = 0.35;

% Geração das imagens
imagem_a = imread("figure/a.jpg");
imagem_b = imread("figure/b.jpg");
imagem_c = imread("figure/c.jpg");
imagem_y8 = imread("figure/y8.jpg");
imagem_y9 = imread("figure/y9.jpg");
imagem_y10 = imread("figure/y10.jpg");

h.imagem_1_axes = axes ("position", [pos_grafico_offset_x+0.05 0.72 0.35 0.25]);
imshow(imagem_a);
h.imagem_2_axes = axes ("position", [pos_grafico_offset_x+0.55 0.72 0.35 0.25]);
imshow(imagem_c);
h.imagem_3_axes = axes ("position", [pos_grafico_offset_x+0.05 0.05 0.35 0.25]);
imshow(imagem_y10);

% Escreve as caixas de procura de arquivo na inteface
h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Clique para selecionar o txt 1",
                                "callback", @execute_procura_txt_1,
                                "position", [pos_grafico_offset_x+0.10 0.68 0.25 0.04]);
h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Clique para selecionar o txt 2",
                                "callback", @execute_procura_txt_2,
                                "position", [pos_grafico_offset_x+0.60 0.68 0.25 0.04]);

% Escreve o texto = e outros na inteface
h.linecolor_label = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "=",
                               "horizontalalignment", "left",
                               "position", [pos_grafico_offset_x+0.45 0.13 0.08 0.08]);

% Escreve a caixa resultado na inteface
h.plot_title_edit = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "Resultado",
                               "position", [pos_grafico_offset_x+0.50 0.14 0.15 0.06]);

% Geração dos gráficos
h.grafico_1 = axes ("position", [pos_grafico_offset_x+0.05 pos_grafico_offset_y 0.35 0.3]);
h.grafico_2 = axes ("position", [pos_grafico_offset_x+0.55 pos_grafico_offset_y 0.35 0.3]);

h.plot_1 = plot (h.x1, h.y1, "b","Parent",h.grafico_1);
xlabel ("eixo X - grafico 1");
ylabel ("eixo Y - grafico 1");
title("Grafico 1")
h.plot_2 = plot (h.x2, h.y2, "b","Parent",h.grafico_2);
xlabel ("eixo X - grafico 2");
ylabel ("eixo Y - grafico 2");
title("Grafico 2")

% Cria interface gráfica
guidata (gcf, h)
