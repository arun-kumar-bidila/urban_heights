import type { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";
import { catchAsync } from "../utils/catchAsync.ts";
import AppError from "../utils/appError.ts";

export interface AuthRequest extends Request {
  userId?: string;
}

export const authMiddleware = catchAsync(
  async (req: AuthRequest, res: Response, next: NextFunction) => {
    const header = req.headers.authorization;

    if (!header || !header.startsWith("Bearer")) {
      throw new AppError("No header provided.", 400);
    }

    const token = header.split(" ")[1] as string;
    if (!token) {
      throw new AppError("No token provided.", 400);
    }
    const result = jwt.verify(token, "secretKey") as { userId: string };
    req.userId = result.userId;
    next();
  },
);
