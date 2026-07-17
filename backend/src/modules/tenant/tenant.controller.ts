import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";
import type { Response } from "express";
import { createTenant } from "./tenant.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";

export const createTenantController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const { fullName, mobile, email, roomId } = req.body;

    const apartmentId = req.userId as string;

    const response = await createTenant({
      fullName,
      mobile,
      email,
      roomId,
      apartmentId,
    });

    sendResponse(res, {
      statusCode: 201,
      message: response.message,
    });
  },
);
