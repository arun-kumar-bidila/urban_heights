import mongoose, { Schema, Model, Document } from "mongoose";
import type { Mode } from "node:fs";

export interface IMember {
  fullName: string;
  relation: string;
}
export interface ITenant {
  fullName: string;
  mobile: string;
  email: string;
  roomId: mongoose.Types.ObjectId;
  apartmentId: mongoose.Types.ObjectId;
  members: IMember[];
  createdAt: string;
  updatedAt: string;
}

const memberSchema: Schema<IMember> = new Schema(
  {
    fullName: {
      type: String,
      required: true,
      trim: true,
    },
    relation: {
      type: String,
      required: true,
      trim: true,
    },
  },
  { _id: false },
);

const tenantSchema: Schema<ITenant> = new Schema(
  {
    fullName: {
      type: String,
      required: true,
      trim: true,
    },
    mobile: {
      type: String,
      required: true,
      trim: true,
    },
    email: {
      type: String,
      required: true,
      trim: true,
    },
    roomId: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Room",
    },
    apartmentId: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: "Apartment",
    },
    members: {
      type: [memberSchema],
      default: [],
    },
  },
  { timestamps: true },
);

const Tenant: Model<ITenant> = mongoose.model("Tenant", tenantSchema);

export default Tenant;
