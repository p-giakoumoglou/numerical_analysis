%resolution par methode de simplex
function simplex()
clc;clear;
prompt = {'c=', 'max == 1 or min==2','number of constraints = '};
lineno=1;
title= 'entrer les données';
def={'[ ]','0','0'};
options.Resize='on';
a = inputdlg(prompt,title,lineno,def,options);
a=char(a);
[m,n] = size(a);
cout=eval(a(1,:));
nbr=eval(a(3,1));
type=eval(a(2,1));
str1=struct('vari',{},'Type',{});
str2=struct('var_base',{},'valeur',{});
for i=1:nbr
prompt ={'enter the different type of constraints(<=,>=,=):'};
title= 'entrer les données';
def={''};
options.Resize='on';
p = inputdlg(prompt,title,lineno,def,options);
p=char(p);
opert=p;
 str1(1,i).Type=opert;
end

prompt = {'A='};
lineno=1;
title= 'entrer les données';
def={'[ ]'};
options.Resize='on';
t = inputdlg(prompt,title,lineno,def,options);
t=char(t);
sc=eval(t);
prompt = {'b='};
lineno=1;
title= 'entrer les données';
def={'[ ]'};
options.Resize='on';
u = inputdlg(prompt,title,lineno,def,options);
u=char(u);
second=eval(u);
M=100*max(max(sc));
sc1=[];
%initialisation des variables d''activité
v_a=zeros(1,length(cout));
%initialisation des variables d'ecarts
v_e=[];
v_b=[];
v_ari=[];
sc2=[];
j=1;
for i=1:nbr
    n=str1(1,i).Type;
    if n(1)~= '<' && isempty(sc2);
        sc2=zeros(nbr,1);
    end
    switch str1(1,i).Type
        case '<=' 
            v_e=[v_e second(i)];
            sc1(j,length(v_e))=1;
            v_b=[v_b,second(i)];
            
        case '>='
            v_e=[v_e 0];
              sc1(j,length(v_e))=-1;
              v_ari=[v_ari second(i)];
              sc2(j,length(v_ari))=1;
              v_b=[v_b,second(i)];
              
        case'=' 
            v_ari=[v_ari second(i)];
              sc2(j,length(v_ari))=1;
              v_b=[v_b,second(i)];
              
    end
    j=j+1;
end

sc=[sc,sc1,sc2];
vari=[];
vari_a=[];
vari_e=[];
vari_ar=[];
for i=1:size(sc,2)
    str1(1,i).vari=['x',num2str(i)];
    vari=[vari,str1(1,i).vari,' '];
    if i<length(v_a)
        vari_a=[vari_a,str1(1,i).vari,' '];
    elseif i<=length(v_a)+length(v_e)
        vari_e=[vari_e,str1(1,i).vari,' '];
    else
        vari_ar=[vari_ar,str1(1,i).vari,' '];
    end
end
%Tableau 0
x=[v_a,v_e,v_ari];

if length(v_ari~=0)
    v_ar=ones(1,length(v_ari));
    if type==1
        v_ar=-M*length(v_ari).*v_ar;
    else
       v_ar=M*length(v_ari).*v_ar;
    end
else  v_ar=[];
end
Cj=[cout,0.*v_e,v_ar];
Vb=[];
Q=v_b;
Ci=[];
tabl=[];
for i=1:length(Q)
    tabl=[tabl; ' | '];
    str2(1,i).valeur=Q(i);
    ind=find(x==Q(i));
    str2(1,i).var_base=str1(1,ind).vari;
    Vb=[Vb,str2(1,i).var_base,' '];
    Ci=[Ci,Cj(ind)];
end
Z=sum(Ci.*Q);
for i=1:length(Cj)
    Zj(i)=sum(Ci'.*sc(:,i));
end
Cj_Zj=Cj-Zj;
l=[];
for i=1:nbr
    if length(str2(1,i).var_base)==2
        l=[l;str2(1,i).var_base,' '];
    else
         l=[l;str2(1,i).var_base];
    end
end
fprintf('\n');
%disp('===========================Programme sous Forme Standard===========================');
%disp(['les variables : ',vari]);
%disp(['                   -les variables d''activité    : ',vari_a]);
%disp(['                   -les variables d''ecarts    : ',vari_e]);
%disp(['                   -les variables artificiels    : ',vari_ar]);
disp('============================Simplex Tableau 0==================================');
%disp(['initialisation des variables : ',vari]);
%disp(['                   -les variables d''activité    : ',num2str(v_a)]);
%disp(['                   -les variables d''ecarts    : ',num2str(v_e)]);
%disp(['                   -les variables artificiels    : ',num2str(v_ar)]);
disp(['Cj                  : ',num2str(-Cj)]);
disp(['z                   : ',num2str(0)]);
disp('_______________________________________________________________________');
disp([tabl,num2str(Ci'),tabl,l,tabl,num2str(sc),tabl,tabl,num2str(Q'),tabl]);
disp('_______________________________________________________________________');
%disp(['Zj                  : ',num2str(Zj)]); 
%disp(['Cj-Zj                  : ',num2str(Cj-Zj)]);        
%disp(['Z                  : ',num2str(Z)]);  
disp([' ']);
disp([' ']);
t=1;
arret=1;
while arret==1
    %tableau t
    if type==1
        num=max(Cj_Zj);num=num(1);
        num1=find(Cj_Zj==num);num1=num1(1);
        V_ent=str1(1,num1).vari;
    else
      g=min(Cj_Zj);g=g(1);
        num1=find(Cj_Zj==g);num1=num1(1);
        V_ent=str1(1,num1).vari;                ['x',num2str(num1)];
    end
    b=sc(:,num1);
    k=0;d=10000;
    for i=1:length(Q)
        if b(i)>0
            div=Q(i)/b(i);
            if d>div
                d=div;
                k=i;
            end
        end
    end
    if k~=0
        num2=k;
    else
        disp('on n''arrive pas à trouver V.S : la solution est infinie ');
        break;
    end
    V_sort=str2(1,num2).var_base;
    str2(1,num2).var_base=str1(1,num1).vari;
    pivot=sc(num2,num1);
    Ci(num2)=Cj(num1);
    sc(num2,:)=sc(num2,:)./pivot;
    Q(num2)=Q(num2)/pivot;
    h=size(sc,1);
    for i=1:h
        if i~=num2
            Q(i)=Q(i)-sc(i,num1)*Q(num2);
            sc(i,:)=sc(i,:)-sc(i,num1).*sc(num2,:);
            
        end
    end
    Z=sum(Ci.*Q);
    for i=1:size(sc,2)
        Zj(i)=sum(Ci'.*sc(:,i));
    end
    Cj_Zj=Cj-Zj;
    l=[];V=[];
    for i=1:nbr
        if length(str2(1,i).var_base)==2
            l=[l;str2(1,i).var_base,' '];
            V=[V,l(i,:),' '];
        else
          l=[l;str2(1,i).var_base];
          V=[V,l(i,:),' '];
        end
    end
    Vb=V;
disp(['============================Simplex Tableau ',num2str(t),'============================']);
disp(['Zj-Cj                  : ',num2str(Zj-Cj)]);        
disp(['Z                      : ',num2str(Z)]); 
%disp(['V.E           : ',num2str(V_ent)]);
%disp(['V.S              : ',num2str(V_sort)]);
%disp(['Pivot              : ',num2str(pivot)]);
%disp(['Var base              : ',num2str(Vb)]);
%disp(['Cj                  : ',num2str(Cj)]);
disp('_______________________________________________________________________');
disp([tabl,num2str(Ci'),tabl,l,tabl,num2str(sc),tabl,tabl,num2str(Q'),tabl]);
disp('_______________________________________________________________________');
%disp(['Zj                  : ',num2str(Zj)]); 
%disp(['Cj-Zj                  : ',num2str(Cj-Zj)]);        
%disp(['Z                  : ',num2str(Z)]);  
disp(['Basic to Non-Basic:     : ',num2str(V_ent),' <-> ',num2str(V_sort)]);
disp([' ']);
disp([' ']);
t=t+1;
if type==1
    a=max(Cj_Zj);a=a(1);
    if a<=0
        break;
    end
else
a=min(Cj_Zj);a=a(1); 
if a>=0 break;
end
end
end
p=num2str(Z);
%k= msgbox( p,'COUT OPTIMAL :');
