import type { Response } from "express";

interface SendResponseOptions<T> {
  statusCode?: number;
  message?: string;
  data?: T;
}

export const sendResponse = <T>(
  res: Response,
  options: SendResponseOptions<T>,
) => {
  const { statusCode = 200, message = "Success", data } = options;

  res.status(statusCode).json({ message, data });
};
