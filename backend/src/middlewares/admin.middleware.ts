import type { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken";

export interface AdminRequest extends Request {
  adminId?: string;
}

export const adminMiddleware = async (
  req: AdminRequest,
  res: Response,
  next: NextFunction,
) => {
  try {
    const header = req.headers.authorization;

    if (!header || !header.startsWith("Bearer")) {
      return res.status(400).json({ message: "Header is Missing" });
    }

    const token = header.split(" ")[1] as string;
    const result = jwt.verify(token, "secretKey") as { adminId: string };
    req.adminId = result.adminId;
    next();
  } catch (error) {
    return res.status(500).json({ message: "Failed to Verify Token" });
  }
};
