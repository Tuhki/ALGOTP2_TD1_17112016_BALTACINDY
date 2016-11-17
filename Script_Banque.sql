create schema BANQUE;

-- Table CLIENT
create table CLIENT (NUMCLI int(10) not null,
					NOM char(20) not null,
					PRENOM char(20) not null,
					ADRESSE char(60) not null,
				primary key (NUMCLI));

-- Table CONTRAT					
create table CONTRAT (NUMCONTRAT int(10) not null,
					DATESOUSCRIPTION int(8) not null,
					NUMCLI int(10) not null,
					NUMCOMPTE int(20) not null,
				primary key (NUMCONTRAT),
				foreign key (NUMCLI) references CLIENT
					on delete no action on update cascade,
				foreign key (NUMCOMPTE) references COMPTE
					on delete no action on update cascade);

-- Table COMPTE				
create table COMPTE (NUMCOMPTE int(20) not null,
					SOLDE int(15) not null,
				primary key (NUMCOMPTE));
						
-- Table OPERATION_COMPTE	
create table OPERATION_COMPTE (NUMOPERATION int(10) not null,
							DATEOPERATION int(8) not null,
							MONTANT int(15) not null,
							NUMCOMPTE int(20) not null,
						primary key (NUMOPERATION)
							on delete no action on update cascade
						foreign key (NUMCOMPTE) references COMPTE
							on delete no action on update cascade);
				
	
-- INDEX	
create index XCLI_NUMCLI on CLIENT(NUMCLI);

create index XCOM_NUMCOMPTE on COMPTE(NUMCOMPTE);

create index XCONT_NUMCONTRAT on CONTRAT(NUMCONTRAT);

create index XOPE_NUMOPERATION on OPERATION_COMPTE(NUMOPERATION);

create index XCONT_NUMCLI on CONTRAT(NUMCLI);
create index XCONT_NUMCOMPTE on CONTRAT(NUMCOMPTE);

create index XOPE_NUMCOMPTE on OPERATION_COMPTE(NUMCOMPTE);