import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";

import type { Response } from "express";
import { createComplaint } from "./complaint.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";

export const createComplaintController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const { title, description, roomId, apartmentId } = req.body;

    const tenantId = req.userId as string;
    const result = await createComplaint({
      title,
      description,
      tenantId,
      roomId,
      apartmentId,
    });

    sendResponse(res, {
      statusCode: 201,
      message: result.message,
    });
  },
);
