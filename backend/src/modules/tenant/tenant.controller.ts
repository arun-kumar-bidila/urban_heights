import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";
import { type Request, type Response } from "express";
import {
  changeRoom,
  createTenant,
  loginTenant,
  removeTenant,
} from "./tenant.service.ts";
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

    const response = await createTenant({
      fullName,
      mobile,
      email,
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

export const changeRoomController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const { tenantId, currentRoomId, newRoomId, newRoomType, newRoomNumber } =
      req.body;

    const apartmentId = req.userId as string;

    const result = await changeRoom({
      tenantId,
      currentRoomId,
      newRoomId,
      newRoomType,
      newRoomNumber,
      apartmentId,
    });

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
    });
  },
);

export const removeTenantController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const { tenantId } = req.body;

    const apartmentId = req.userId as string;

    const result = await removeTenant({ tenantId, apartmentId });

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
    });
  },
);
