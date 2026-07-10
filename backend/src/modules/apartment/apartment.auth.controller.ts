import type { Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.ts";
import {
  allApartments,
  createApartment,
  fetchApartment,
  fetchSummary,
  loginApartment,
} from "./apartment.auth.service.ts";
import { sendResponse } from "../../utils/sendResponse.ts";
import type { AuthRequest } from "../../middlewares/auth.middleware.ts";

export const createApartmentController = catchAsync(
  async (req: Request, res: Response) => {
    const {
      apartmentName,
      address,
      ownerMobile,
      ownerName,
      password,
      ownerCode,
    } = req.body;

    const result = await createApartment({
      apartmentName,
      address,
      ownerMobile,
      ownerName,
      ownerCode,
      password,
    });

    sendResponse(res, {
      statusCode: 201,
      message: result.message,
      data: {
        apartmentCode: result.apartmentCode,
        ownerCode: result.ownerCode,
      },
    });
  },
);

export const loginApartmentController = catchAsync(
  async (req: Request, res: Response) => {
    const { apartmentId, password } = req.body;
    const result = await loginApartment({
      apartmentId,
      password,
    });

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
      data: { token: result.token },
    });
  },
);

export const fetchApartmentController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const userId = req.userId as string;

    const result = await fetchApartment(userId);

    sendResponse(res, {
      statusCode: 200,
      message: result.message,
      data: result.apartment,
    });
  },
);

export const fetchSummaryController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const result = await fetchSummary();

    sendResponse(res, {
      message: result.message,
      statusCode: 200,
      data: {
        totalApartments: result.totalApartments,
        totalOwners: result.totalOwners,
      },
    });
  },
);

export const allApartmentsController = catchAsync(
  async (req: AuthRequest, res: Response) => {
    const result = await allApartments();

    sendResponse(res, {
      message: result.message,
      data: {
        apartments: result.apartments,
      },
    });
  },
);
