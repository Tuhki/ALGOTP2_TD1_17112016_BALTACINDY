create schema MAGASIN;

-- Table CLIENT
create table CLIENT (NUMCLI int(10) not null,
					NOM char(20) not null,
					PRENOM char(20) not null,
					ADRESSE char(60) not null,
				primary key (NUMCLI));

-- Table COMMANDE					
create table COMMANDE (NUMCOMM int(10) not null,
					DATESCOMM int(8) not null,
					ADRESSELIV char(60) not null, 
					NUMCLI int(10) not null,					
				primary key (NUMCOMM),
				foreign key (NUMCLI) references CLIENT
					on delete no action on update cascade);
					
-- Table DETAIL_COMM				
create table DETAIL_COMM (DE_NUMCOMM int(10) not null,
						EN_CODEPROD int(10) not null,
						QUANTITEPROD int(10) not null,
				primary key (DE_NUMCOMM, EN_CODEPROD),
				foreign key (DE_NUMCOMM) references COMMANDE
					on delete no action on update cascade,
				foreign key (EN_CODEPROD) references PRODUIT
					on delete no action on update cascade);
						
-- Table PRODUIT	
create table PRODUIT (CODEPROD int(10) not null,
					LIBELLE char(20) not null,
					PRIXUNIT int(10) not null,
					STOCK int(20) not null,
				primary key (CODEPROD);
										
	
-- INDEX	
create index XCLI_NUMCLI on CLIENT(NUMCLI);

create index XCOMM_NUMCOMMM on COMMANDE(NUMCOMM);
create index XCOMM_NUMCLI on COMMANDE(NUMCLI);

create index XPROD_CODEPROD on PRODUIT(CODEPROD);

create index XOPE_NUMOPERATION on OPERATION_COMPTE(NUMOPERATION);

create index XDETA_DE_NUMCOMM on DETAIL_COMM(DE_NUMCOMM);
create index XDETA_EN_CODEPROD on DETAIL_COMM(EN_CODEPROD);