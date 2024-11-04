import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

export default async function Home() {
  const cars = await prisma.vehicle.findMany();

  return (
    <div className="p-6 max-w-2xl mx-auto">
      <h1 className="text-3xl font-bold mb-4 text-center">Car Listings</h1>
      <ul className="space-y-2">
        {cars.map((vehicle) => (
          <li key={vehicle.vinnum}>
            <a href={``} className="text-lg text-blue-600 hover:underline">
              {vehicle.year} - {vehicle.make} {vehicle.model}
            </a>
          </li>
        ))}
      </ul>
    </div>
  );
}
