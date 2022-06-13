import { NextResponse } from "next/server";

const userPages = ["/dashboard"];

const cookies = (req) => {
  if (userPages.find((page) => req.nextUrl.pathname === page)) {
    const token = req.cookies.MORELMAP_ACCESS_TOKEN;

    // todo: verify
    if (!token) {
      NextResponse.redirect("/signin");
    }
  }
};

export default cookies;
