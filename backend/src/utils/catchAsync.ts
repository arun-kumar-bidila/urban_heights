import type { NextFunction } from "express";
import type { AuthRequest } from "../middlewares/auth.middleware.ts";
import type { Response } from "express";

type AsyncHandler = (
  req: AuthRequest,
  res: Response,
  next: NextFunction,
) => Promise<any>;

export const catchAsync =
  (fn: AsyncHandler) =>
  (req: AuthRequest, res: Response, next: NextFunction) => {
    Promise.resolve(fn(req, res, next)).catch(next);
  };
