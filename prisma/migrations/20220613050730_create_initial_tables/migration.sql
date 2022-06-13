-- CreateTable
CREATE TABLE "Cafe" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "name" TEXT NOT NULL,
    "phone" TEXT,

    CONSTRAINT "Cafe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dish" (
    "id" TEXT NOT NULL,
    "cafeId" TEXT NOT NULL,
    "hasVeganOption" BOOLEAN NOT NULL DEFAULT false,
    "isVegan" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,

    CONSTRAINT "Dish_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DishReview" (
    "id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "dishId" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "DishReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CafeReview" (
    "id" TEXT NOT NULL,
    "cafeId" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "CafeReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "image" TEXT,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cafe_id_key" ON "Cafe"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Dish_id_key" ON "Dish"("id");

-- CreateIndex
CREATE UNIQUE INDEX "DishReview_id_key" ON "DishReview"("id");

-- CreateIndex
CREATE UNIQUE INDEX "CafeReview_id_key" ON "CafeReview"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_id_key" ON "User"("id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Dish" ADD CONSTRAINT "Dish_cafeId_fkey" FOREIGN KEY ("cafeId") REFERENCES "Cafe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DishReview" ADD CONSTRAINT "DishReview_dishId_fkey" FOREIGN KEY ("dishId") REFERENCES "Dish"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DishReview" ADD CONSTRAINT "DishReview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CafeReview" ADD CONSTRAINT "CafeReview_cafeId_fkey" FOREIGN KEY ("cafeId") REFERENCES "Cafe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CafeReview" ADD CONSTRAINT "CafeReview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
