CREATE TABLE "public.compras" (
	"id" serial NOT NULL,
	"usuárioId" int NOT NULL,
	"status" TEXT NOT NULL DEFAULT 'criada',
	"dataDeFinalização" TIMESTAMP,
	CONSTRAINT "compras_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.produtos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	"preço" int NOT NULL,
	"fotoPrincipal" TEXT NOT NULL,
	CONSTRAINT "produtos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.usuários" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"senha" TEXT NOT NULL,
	"endereçoId" int NOT NULL,
	CONSTRAINT "usuários_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.roupas" (
	"id" serial NOT NULL,
	"produtoId" int NOT NULL,
	"categoriaId" int NOT NULL,
	"tamanho" varchar(1) NOT NULL,
	CONSTRAINT "roupas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.endereços" (
	"id" serial NOT NULL,
	"estado" TEXT NOT NULL,
	"cidade" TEXT NOT NULL,
	"CEP" varchar(8) NOT NULL,
	"rua" TEXT NOT NULL,
	"numero" int NOT NULL,
	"complemento" TEXT DEFAULT 'null',
	CONSTRAINT "endereços_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categoriasRoupas" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "categoriasRoupas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.FotosProdutos" (
	"id" serial NOT NULL,
	"fotoId" int NOT NULL,
	"produtoId" int NOT NULL,
	CONSTRAINT "FotosProdutos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Foto" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "Foto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.itensSelecionados" (
	"id" serial NOT NULL,
	"compraId" int NOT NULL,
	"produtoId" int NOT NULL,
	"quantidade" int NOT NULL,
	CONSTRAINT "itensSelecionados_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "compras" ADD CONSTRAINT "compras_fk0" FOREIGN KEY ("usuárioId") REFERENCES "usuários"("id");


ALTER TABLE "usuários" ADD CONSTRAINT "usuários_fk0" FOREIGN KEY ("endereçoId") REFERENCES "endereços"("id");

ALTER TABLE "roupas" ADD CONSTRAINT "roupas_fk0" FOREIGN KEY ("produtoId") REFERENCES "produtos"("id");
ALTER TABLE "roupas" ADD CONSTRAINT "roupas_fk1" FOREIGN KEY ("categoriaId") REFERENCES "categoriasRoupas"("id");



ALTER TABLE "FotosProdutos" ADD CONSTRAINT "FotosProdutos_fk0" FOREIGN KEY ("fotoId") REFERENCES "Foto"("id");
ALTER TABLE "FotosProdutos" ADD CONSTRAINT "FotosProdutos_fk1" FOREIGN KEY ("produtoId") REFERENCES "produtos"("id");


ALTER TABLE "itensSelecionados" ADD CONSTRAINT "itensSelecionados_fk0" FOREIGN KEY ("compraId") REFERENCES "compras"("id");
ALTER TABLE "itensSelecionados" ADD CONSTRAINT "itensSelecionados_fk1" FOREIGN KEY ("produtoId") REFERENCES "produtos"("id");
















