   M S B A M L   `   `   `  ����O  KGestion_des_patients, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Gestion_des_patientsGestion_des_patients  5   	   ,    &Gestion_des_patients.Ajouter_admission   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:Gestion_des_patients     5   	   -   5          � Title$  Ajouter_admission��5	         	tabwindow#��[  6"   $��653.342��6]    � WindowStartupLocation$ CenterScreen=�6n   $��993.605��6�   .��5
      � .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ datagrid_admission��5        
tabcontrol#��[ 60      AutoGenerateColumns .  $
��Left=�6�   $	��142��6�   $��	20,25,0,0q�6�   $	��Top=�6�   $	��946��6�   ���	#FFE83434$
��Bold"�6  $��Times New Roman)�6  $��13(�62  
���   ���6r   ��    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ IDAdmission��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6:   �� *IDAdmission+ �� Mode$ OneWay=�  5      $ chirurgie_programmé��6%    6B   �� *chirurgie_programmé+$ OneWay=�  5      $ date_admission��6%    6=   �� *date_admission+$ OneWay=�  5      $ date_chirurgie��6%    6=   �� *date_chirurgie+$ OneWay=�  5      $ date_congé��6%    69   �� *date_congé+$ OneWay=�  5      $ téléviseur��6%    69   �� *téléviseur+$ OneWay=�  5      $ téléphone��6%    68   �� *téléphone+$ OneWay=�  5      $	 NSS��6%    62   �� *NSS+$ OneWay=�  5      $ 
Numérolit��6%    68   �� *
Numérolit+$ OneWay=�  5      $ 
IDMédecin��6%    68   �� *
IDMédecin+$ OneWay=�5      �� 5   
   #��[ 6   $
��Left=�6<   $	��408��6W   $��
20,188,0,0q�6d   $	��Top=�6x   $	��946��6�   .@�5      �� $��Ajouter admission��6   $��14(�61   .��5      � $
��0,-5q�6    � ColumnDefinitions 5      �� 5      $	��49* �6+   �� 5       $
��867* �6+   .+�5"      �� -   5        	 ��Name$	 text_idadmission��5"   C     
StlSimple3#��[ 6   $
��Left=�6]   $��40��6x   $��
292,10,0,0q�6�   
 �� TextWrapping$

 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��160��6�   $��1��6�   �� 5#      -   5         ��Name$ bnajout_admission��5#      $��Ajouter admission��69     	tabbutton#��[ 6U   $��292,190,405,152q�6x   $��1��6�   $��Times New Roman)�6�   $��22(�6�   �� 5$      -   5        $	 text_nsspatient��5$   W   #��[ 6   $��Black"�6B   $
��Left=�6p   $��32��6�   $��
685,64,0,0q�6�   $

 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��170��6�   $��1��6�   �� 5%      $��ID admission (nouveau)��6   $
��Left=�6=   $��32��6X   $��
123,18,0,0q�6d   $	��Top=�6x   $	��164��6�   $��1��6�   �� 5&      $��Date d'admission��6   $
��Left=�67   $��32��6R   $��2,69,0,0q�6^   $	��Top=�6p   $	��140��6�   $��2��6�   �� 5'      $��Date chirurgie��6   $
��Left=�65   $��32��6P   $��
10,106,0,0q�6\   $	��Top=�6p   $	��113��6�   $��2��6�   �� 5(      $��Date de congé��6   $
��Left=�64   $��32��6O   $��	2,146,0,0q�6[   $	��Top=�6n   $	��121��6�   $��2��6�   �� 5)      $&�� Numéro de sécurité social NSS��6   $
��Left=�6D   $��32��6_   $��
467,70,0,0q�6k   $	��Top=�6   $	��213��6�   $��1��6�   �� 5*      $&�� Choisir un lit pour réservation��6   $
��Left=�6F   $��32��6a   $��472,146,0,0q�6m   $	��Top=�6�   $	��224��6�   $��1��6�   �� 5+      $��ID Médecin��6   $
��Left=�61   $��32��6L   $��591,183,0,0q�6X   $	��Top=�6m   $��89��6�    J� RenderTransformOrigin$ 3.416,0.344&�6�   $��1��6�   (  "System.Windows.Controls.DatePicker  5,      -   5          Name$ text_dateadmission��5,   !   $��Right=�6=   $��32��6Y   $��
0,70,625,0q�6e   $	��Top=�6y   $	��171��6�   $ 0.611,0.594&�6�   $��1��6�   �� 5-      -   5         ��Name$ text_checkchirurgie��5-      $��Chirurgie programmé��6<   $
��Left=�6Z   $��21��6u   $��
292,75,0,0q�6�   $	��Top=�6�   $	��170��6�   $��1��6�     5.      -   5        $ text_datechirurgie��5.   !   $
��Left=�6=   $��32��6X   $��
94,112,0,0q�6d   $	��Top=�6x   $	��171��6�   $��1��6�   �� 5/      -	   5        $ text_checktélévision��5/      $��Télévision��6=   $
��Left=�6R   $��20��6m   $��292,112,0,0q�6y   $	��Top=�6�   $	��139��6�   $��1��6�   �� 50      -
   5        $ text_checktéléphone��50      $��Téléphone��6<   $
��Left=�6P   $��20��6k   $��292,152,0,0q�6w   $	��Top=�6�   $	��139��6�   $��1��6�     51      -   5        $ text_datecongée��51   !   {�.  $
��Left=�6P   $��32��6k   $��
94,154,0,0q�6w   $	��Top=�6�   $	��171��6�   $��1��6�   �� 52      -   5         ��Name$ combo_numerolit��52      $ �� IsSynchronizedWithCurrentItem$
 TrueY�68    �� DisplayMemberPath$ 
Numérolit��6u   $
��Left=�6�   $��29��6�   $��685,143,0,0q�6�   $	��Top=�6�   $	��170��6�   $��1��6�   ��6]   �� 6�   �� 53      -   5        $ combo_idmedecin��53      $
 TrueY�68   $ 
IDMédecin��6u   $
��Left=�6�   $��32��6�   $��685,183,0,0q�6�   $	��Top=�6�   $	��170��6�   $ 3.465,0.086&�6�   $��1��6  ��6]   �� 6    54      -   5        $ datagrid_lit_partype��54      $
 TrueY�6>    .  $
��Left=�6�   $	��118��6�   $	��Top=�6�   $	��324��6�   $��531,244,0,0q�6�   $��1��6�   ���	#FFE83838��6�   ��  55        56      $ 
Numérolit��61    6E   �� *
Numérolit+$ OneWay=�  57      $ occupé��61    6A   �� *	occupé+$ OneWay=�  58      $ IDType��61    6A   �� *IDType+$ OneWay=�  59      $ IDDépartement��61    6H   �� *IDDépartement+$ OneWay=�5A      �� 5B      -   5        $ id_listLits_SansFraisSup��5B      $ description��6Z   $
 TrueY�6z    �� SelectedIndex$ 0��6�   $
��Left=�6�   $��31��6�   $��685,106,0,0q�6�   $	��Top=�6�   $	��170��6  $ 	1.152,0.5&�6O  $��1��6q  ��6B   �� 6q  �� 5C      $ ��    Choisir le type de lit��6   $
��Left=�6A   $��31��6\   $��520,110,0,0q�6h   $	��Top=�6}   $	��160��6�   $��1��6�   $ 0.612,-0.952&�6�   �� 5D      -   5        $	 id_facture_total��5D   B   #��[ 6   $
��Left=�6\   $��47��6w   $��292,248,0,0q�6�   $

 Wrap=�6�   $�� ��6�   $	��Top=�6�   $	��193��6�   $��1��6�   �� 5E      $��Tarif quotidien à payer��6   $��1��6>   $
��Left=�6N   $��31��6i   $��105,264,0,0q�6u   $	��Top=�6�   $	��160��6�   5F      5G      5H      5K      5L      