import type { AuthRequest } from "../../middlewares/auth.middleware.ts";
import { catchAsync } from "../../utils/catchAsync.ts";

import type { Response } from "express";
import {
  createComplaint,
  fetchComplaintsByApartment,
} from "./complaint.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";

export const createComplaintController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const {
      title,
      description,
      roomNumber,
      tenantName,
      tenantMobile,
      roomId,
      apartmentId,
    } = req.body;

    const tenantId = req.userId as string;
    const result = await createComplaint({
      title,
      description,
      roomNumber,
      tenantName,
      tenantMobile,
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

export const fetchComplaintsByApartmentController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const apartmentId = req.userId as string;

    const result = await fetchComplaintsByApartment(apartmentId);

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
      data: result.data,
    });
  },
);
