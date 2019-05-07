function [] = Main()

    %% Model Construction
    close all; clc;

    % Filename
    name = 'truss1';

    % Full name of the inputfile
    inputfile = fullfile(pwd,'Input',sprintf('%s.inp',name));

    %% Read Abaqus Input File
    [Model,Material,BoundaryConditions] = ReadInputAbaqus(inputfile);

    %% Assemble the Stiffness Matrix
    [Model] = Assembly(Model,Material);


    %% Plotting

    % Plot the undeformed shape
    Visualize(name,Model,'Undeformed');

    % Make a sparsity plot for the Stiffness Matrix
    Visualize(name,Model,'Stiffness');
end

%% Auxiliary Functions

function [Model,Material,BC] = ReadInputAbaqus(filename)
% Reads Abaqus Input files (.inp) and stores model, material and BC info
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%     filename : name of the input file to be read | string
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output:
%     Model    : Matlab structure that contains all information regarding
%                the model's geometry (see description below)
%     Material : A structure that contains all information regarding the
%                material model used in the finite element analysis (see
%                description below)
%     BC       : A structure that contains all information regarding the
%                displacement or force boundary conditions imposed in 
%                subregions of the model (see description below)
%
%     ---------------------------------------------------------------------
%
%     Model.coordinates  -> Nodal coordinates of each node in the model
%     Model.connectivity -> Element connectivity table
%     Model.area         -> Cross Sectional Area of the elements
%
%     ---------------------------------------------------------------------
%
%     Material.young     -> The Young's modulus of the linear elastic model
%
%     ---------------------------------------------------------------------
%
%     BC.displacement    -> A table with 3 columns: (See following example)
%
%               | Node Number | Degree of Freedom | Value of Displacement |
%               |      23     |          1        |           0.0         |
%               |      23     |          2        |           0.1         |
%               |     112     |          1        |          -2.0         |
%
%     BC.force           -> A table with 3 columns: (See following example)
%
%               | Node Number | Degree of Freedom | Value of Applied Force|
%               |      32     |          1        |           1.5         |
%               |      40     |          2        |           5.0         |
%               |     180     |          1        |          -9.0         |
%
%     ---------------------------------------------------------------------


%   Your coding to define: coordinates, connectivity, area, displacement
%                          young and force

    Model.coordinates = coordinates;
    Model.connectivity = connectivity;
    Model.area = area;
    
    Material.young = E;
    
    BC.displacement = displacement;
    BC.force = force;
    
end

function [Ke] = Truss2D(Coor1,Coor2,Ae,Ee)
% Creates the stiffness matrix for a 2D truss element
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%     Coor1   : Row vector of the x,y coordinates of the bar's left point
%     Coor2   : Row vector of the x,y coordinates of the bar's right point
%     Ae      : The cross sectional area of the element
%     Ee      : The Young's modulus of the element
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output:
%     Ke      :  The stiffness matrix for the 2D truss element
%
%     ---------------------------------------------------------------------

%     Your coding to define Ke (4x4) matrix for the stiffness of the bar
%
%        | K11 K12 K13 K14 | (1x)
%        | K21 K22 K23 K24 | (1y)
%  K =   | K31 K32 K33 K34 | (2x)
%        | K41 K42 K43 K44 | (2y)
%         (1x)(1y)(2x)(2y)
%

end

function [Model] = Assembly(Model,Material)
% Assembles the global stiffness matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%     Model    : Matlab structure that contains all information regarding
%     Material : A structure that contains all information regarding the
%                material model used in the finite element analysis
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output:
%     Model    : Matlab structure that contains all information regarding
%                the model's geometry as well as the global stiffness mtrx


    % Include code to define
    %       ndof : The number of degrees of freedom of the model
    %       noel : The number of elements in the model
    %       K    : The global stiffness matrix of the model
    
	% Packing variables back to Model
    Model.ndof = ndof;
    Model.noel = noel;
    Model.K = K;

end


function [] = Visualize(filename,Model,identifier)
% A function that generates plots to visualize the model
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input:
%     filename  : String, used to name the figures and set plot titles
%     Model     : Matlab structure containing the model's geometry
%     K         : The global stiffness matrix
%     identifier: String; What type of plot to generate
%                 Currently: 'Undeformed' or 'Stiffness'
%                 The first plots the undeformed shape of the structure
%                 whereas the second generates a sparsity plot for the
%                 stiffness matrix
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output:
%
%     ---------------------------------------------------------------------

    %Check if output folder is required, and create it if it doesn't exist
    FolderName =[pwd,'/Results'];
    if exist(FolderName,'dir')==0
        mkdir(FolderName)
    end
    
    % What type of plot to generate
    switch identifier
        
        % Creating a plot of the undeformed configuration
        case {'Undeformed','UNDEFORMED'}
            
            
            % Include code to plot the undeformed geometry here
            
        
        % Generating sparsity plot of the global stiffness matrix
        case {'Stiffness','STIFFNESS'}
            
            % Include code to plot the sparsity of the stiffness matrix
            % here
            
    end

end
