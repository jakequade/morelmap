import bcrypt from "bcrypt";
import prisma from "../lib/prisma";

const seedDb = async () => {
  const salt = bcrypt.genSaltSync();

  const user1 = await prisma.user.create({
    data: {
      email: "j2k4@tuta.io",
      image: "https://i.pravatar.cc/300",
      name: "J2k4",
      password: bcrypt.hashSync("password", salt),
    },
  });

  const user2 = await prisma.user.create({
    data: {
      email: "emily@something.com",
      image: "https://i.pravatar.cc/300",
      name: "Emily",
      password: bcrypt.hashSync("password", salt),
    },
  });

  const cafe = await prisma.cafe.create({
    data: {
      name: "Fortuna",
      dishes: {
        create: {
          name: "Eggs Benedict",
          hasVeganOption: false,
          isVegan: false,
          reviews: {
            create: {
              title: "Best eggs benedict I have ever had.",
              comment: "Would happily go again.",
              rating: 5,
              userId: user2.id,
            },
          },
        },
      },
      reviews: {
        create: {
          title: "Not vegan friendly",
          comment:
            "No vegan options. Was a little disappointed I was eating just dry toast.",
          rating: 1,
          userId: user1.id,
        },
      },
    },
  });
};

const run = () => {
  seedDb();
};

run();
