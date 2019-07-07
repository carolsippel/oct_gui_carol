clc
close all
clear all

graphics_toolkit qt

% Configurações da interface gráfica
set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"),
    "Position", [100 100 500 300],
    "Name","QY Calculator - Painel principal - Carol Sippel",
    "NumberTitle","off");

% Funções utilizadas ao pressionar os botões
function duas_medidas (obj)
    source gui_duas_med.m
endfunction

function tres_medidas (obj)
    source gui_tres_med.m
endfunction

h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Abrir programa de duas medidas",
                                "callback", @duas_medidas,
                                "position", [0.24 0.65 0.5 0.20]);
h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "Abrir programa de tres medidas",
                                "callback", @tres_medidas,
                                "position", [0.24 0.15 0.5 0.20]);

guidata (gcf, h)
