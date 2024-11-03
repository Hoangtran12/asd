-- CreateTable
CREATE TABLE "buyer" (
    "userid" INTEGER NOT NULL,
    "numofpurchase" INTEGER DEFAULT 0,
    "buyerrating" DOUBLE PRECISION,

    CONSTRAINT "buyer_pkey" PRIMARY KEY ("userid")
);

-- CreateTable
CREATE TABLE "financinginfo" (
    "sellerid" INTEGER NOT NULL,
    "interestrate" DECIMAL(3,2),

    CONSTRAINT "financinginfo_pkey" PRIMARY KEY ("sellerid")
);

-- CreateTable
CREATE TABLE "listing" (
    "sellerid" INTEGER NOT NULL,
    "vinnum" VARCHAR(17) NOT NULL,
    "price" DECIMAL(10,2) NOT NULL,
    "description" TEXT,
    "datelisted" DATE NOT NULL,

    CONSTRAINT "listing_pkey" PRIMARY KEY ("sellerid","vinnum")
);

-- CreateTable
CREATE TABLE "seller" (
    "userid" INTEGER NOT NULL,
    "numofsale" INTEGER DEFAULT 0,
    "sellerrating" DOUBLE PRECISION,
    "financingoffered" BOOLEAN,

    CONSTRAINT "seller_pkey" PRIMARY KEY ("userid")
);

-- CreateTable
CREATE TABLE "user" (
    "userid" INTEGER NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "firstname" VARCHAR(50) NOT NULL,
    "middleinit" CHAR(1),
    "lastname" VARCHAR(50) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("userid")
);

-- CreateTable
CREATE TABLE "vehicle" (
    "vinnum" VARCHAR(17) NOT NULL,
    "year" INTEGER NOT NULL,
    "make" VARCHAR(50) NOT NULL,
    "model" VARCHAR(50) NOT NULL,
    "trim_lvl" VARCHAR(50),
    "mileage" INTEGER NOT NULL,
    "color" VARCHAR(30),
    "type" VARCHAR(20),

    CONSTRAINT "vehicle_pkey" PRIMARY KEY ("vinnum")
);

-- AddForeignKey
ALTER TABLE "buyer" ADD CONSTRAINT "buyer_userid_fkey" FOREIGN KEY ("userid") REFERENCES "user"("userid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "financinginfo" ADD CONSTRAINT "financinginfo_sellerid_fkey" FOREIGN KEY ("sellerid") REFERENCES "seller"("userid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "listing" ADD CONSTRAINT "listing_sellerid_fkey" FOREIGN KEY ("sellerid") REFERENCES "user"("userid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "listing" ADD CONSTRAINT "listing_vinnum_fkey" FOREIGN KEY ("vinnum") REFERENCES "vehicle"("vinnum") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "seller" ADD CONSTRAINT "seller_userid_fkey" FOREIGN KEY ("userid") REFERENCES "user"("userid") ON DELETE CASCADE ON UPDATE CASCADE;
