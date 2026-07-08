import type { Request, Response } from "express";
import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";
import { sendResponse } from "../../utils/sendResponse.ts";
import {
  fetchProfile,
  loginAdmin,
  registerAdmin,
} from "./admin.auth.service.ts";

export const registerAdminController = catchAsync(
  async (req: Request, res: Response) => {
    const { name, email, password } = req.body;

    const result = await registerAdmin({
      name,
      email,
      password,
    });

    sendResponse(res, {
      statusCode: 201,
      message: result.message,
    });
  },
);

export const loginAdminController = catchAsync(
  async (req: Request, res: Response) => {
    const { email, password } = req.body;
    const result = await loginAdmin({ email, password });

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
      data: { token: result.token },
    });
  },
);

export const profileAdminController = async (
  req: AuthRequest,
  res: Response,
) => {
  const userId = req.userId as string;
  const result = await fetchProfile(userId);

  sendResponse(res, {
    statusCode: 200,
    message: result.message,
    data: result.admin,
  });
};
