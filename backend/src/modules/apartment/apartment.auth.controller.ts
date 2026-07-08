import type { Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.ts";
import { createApartment } from "./apartment.auth.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";

export const createApartmentController = catchAsync(
  async (req: Request, res: Response) => {
    const { apartmentName, address, ownerMobile, ownerName, password } =
      req.body;

    const result = await createApartment({
      apartmentName,
      address,
      ownerMobile,
      ownerName,
      password,
    });

    sendResponse(res, {
      statusCode: 201,
      message: result.message,
      data: { apartmentId: result.apartmentId },
    });
  },
);

export const loginApartmentController = catchAsync(
  async (req: Request, res: Response) => {},
);

export const fetchApartmentController = catchAsync(
  async (req: Request, res: Response) => {},
);
