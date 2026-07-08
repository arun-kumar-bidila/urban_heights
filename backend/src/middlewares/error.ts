import type { Request, Response, NextFunction } from "express";

export const globalErrorHandler = (
  err: any,
  req: Request,
  res: Response,
  next: NextFunction,
): Response => {
  let error = err;
  error.statusCode ||= 500;
  error.message ||= "Something Went Wrong";

  return res.status(error.statusCode).json({ message: error.message });
};
