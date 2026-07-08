import type { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";

export interface AuthRequest extends Request {
  userId?: string;
}

export const authMiddleware = async (
  req: AuthRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const header = req.headers.authorization;

    if (!header || !header.startsWith("Bearer")) {
      return res.status(400).json({ message: "Header is Missing" });
    }

    const token = header.split(" ")[1] as string;
    const result = jwt.verify(token, "secretKey") as { userId: string };
    req.userId = result.userId;
    next();
  } catch (error) {
    return res.status(500).json({ message: "Failed to Verify Token" });
  }
};
