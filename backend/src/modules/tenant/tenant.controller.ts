import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";
import { response, type Request, type Response } from "express";
import { createTenant, loginTenant } from "./tenant.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";
import bcrypt from "bcrypt";

export const createTenantController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const {
      fullName,
      mobile,
      email,
      roomNumber,
      roomType,
      apartmentName,
      roomId,
    } = req.body;

    const apartmentId = req.userId as string;

    const password = mobile.slice(-6);

    const hashedPassword = await bcrypt.hash(password, 10);

    const response = await createTenant({
      fullName,
      mobile,
      email,
      password: hashedPassword,
      roomNumber,
      roomType,
      apartmentName,
      roomId,
      apartmentId,
    });

    sendResponse(res, {
      statusCode: 201,
      message: response.message,
    });
  },
);

export const loginTenantController = catchAsync(
  async (req: Request, res: Response) => {
    const { email, password } = req.body;

    const result = await loginTenant({ email, password });

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
      data: {
        token: result.token,
      },
    });
  },
);
